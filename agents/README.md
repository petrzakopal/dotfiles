# How to install a skill globally for the PI agent

```bash
npx --yes skills add https://github.com/vercel-labs/skills --skill find-skills -g -a pi -y
```

This runs `skills` package without asking to install it first, then `add` is the skills CLI command,
then the repo URL from which the skill will be installed, then the name of the skill, then `-g` to install it globally,
and `-a pi` to install it for the PI agent, and finally `-y` to skip the confirmation prompt.
