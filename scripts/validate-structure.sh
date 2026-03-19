#!/bin/bash
# Validate Agent-PROVE plugin structure
# Run: bash scripts/validate-structure.sh

ERRORS=0
WARNINGS=0

echo "=== Agent-PROVE: Structure Validation ==="
echo ""

# Check manifest
if [ -f ".claude-plugin/plugin.json" ]; then
    echo "✅ .claude-plugin/plugin.json exists"
    python3 -m json.tool .claude-plugin/plugin.json > /dev/null 2>&1 && echo "✅ plugin.json is valid JSON" || { echo "❌ plugin.json is invalid JSON"; ERRORS=$((ERRORS+1)); }
else
    echo "❌ .claude-plugin/plugin.json missing"
    ERRORS=$((ERRORS+1))
fi

# Check agents
AGENT_COUNT=$(ls .claude/agents/*.md 2>/dev/null | wc -l | tr -d ' ')
echo ""
echo "--- Agents ($AGENT_COUNT found) ---"
for agent in .claude/agents/*.md; do
    [ -f "$agent" ] || continue
    name=$(basename "$agent" .md)
    # Check YAML frontmatter
    head -1 "$agent" | grep -q "^---" && echo "✅ $name: has frontmatter" || { echo "❌ $name: missing frontmatter"; ERRORS=$((ERRORS+1)); }
    # Check Evidence Requirement section
    grep -q "## Evidence Requirement" "$agent" && echo "✅ $name: has evidence requirement" || { echo "⚠️  $name: missing evidence requirement section"; WARNINGS=$((WARNINGS+1)); }
done

# Check skills
echo ""
echo "--- Skills ---"
for skill_dir in .claude/skills/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename "$skill_dir")
    [ -f "$skill_dir/SKILL.md" ] && echo "✅ $skill_name: SKILL.md exists" || { echo "❌ $skill_name: SKILL.md missing"; ERRORS=$((ERRORS+1)); }
done

# Check commands
echo ""
echo "--- Commands ---"
for cmd in .claude/commands/*.md; do
    [ -f "$cmd" ] || continue
    name=$(basename "$cmd" .md)
    head -1 "$cmd" | grep -q "^---" && echo "✅ $name: has frontmatter" || { echo "❌ $name: missing frontmatter"; ERRORS=$((ERRORS+1)); }
done

# Check for domain-specific leakage
echo ""
echo "--- Domain Leakage Check ---"
LEAKS=$(grep -r "ProSure\|XBRL\|DPM\|BoE\|EBA" .claude/ 2>/dev/null | wc -l | tr -d ' ')
[ "$LEAKS" -eq 0 ] && echo "✅ No domain-specific references found" || { echo "❌ Found $LEAKS domain-specific references"; ERRORS=$((ERRORS+1)); }

# Summary
echo ""
echo "=== Summary ==="
echo "Agents: $AGENT_COUNT"
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"
[ $ERRORS -eq 0 ] && echo "✅ VALIDATION PASSED" || echo "❌ VALIDATION FAILED ($ERRORS errors)"
exit $ERRORS
