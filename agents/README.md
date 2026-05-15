# How to install a skill globally for the PI agent

```bash
npx --yes skills add https://github.com/vercel-labs/skills --skill find-skills -g -a pi -y
```

This runs `skills` package without asking to install it first, then `add` is the skills CLI command,
then the repo URL from which the skill will be installed, then the name of the skill, then `-g` to install it globally,
and `-a pi` to install it for the PI agent, and finally `-y` to skip the confirmation prompt.

# How to check the usage when connected to ChatGPT GO subscription

The usage is obtained from the Codex Analytics (Limits), which are available at [https://chatgpt.com/codex/cloud/settings/analytics](https://chatgpt.com/codex/cloud/settings/analytics).
