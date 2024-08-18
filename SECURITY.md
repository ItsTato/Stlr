# Stlr Security Policy

We take the security of Stlr extremely seriously. If you believe you have found a vulnerability within the library, you need to report it to us.

We recommend reading this policy fully before you report any vulnerabilities. This helps us ensure that you understand the policy and act in compliance with it.

We value those who take the time and effort to report security vulnerabilities according to this policy and will offer recognition as appropriate. However, as an independent open-source project, we cannot offer monetary rewards for vulnerability disclosures.

"We", "us", "our", etc. in this policy refers to the Stlr maintainers in conjunction. "You", etc. refers to a person who has or intends to discover or report a vulnerability.

## A quick note for our users

It's important that you keep your libraries up to date. We do not monitor, accept reports pertaining to, provide support for, or patch bugs on old versions of Stlr.

If you're experiencing issues, our first recommendation will always be to update Stlr; this applies even if the update is major (breaking).

To be clear, we reserve the right to backport security fixes as we see appropriate, and may do so in extreme circumstances. But as a general rule, it's not something you can expect us to do.

## Reporting

If you believe you have found a security vulnerability in Stlr, you can get in touch with us over Discord.

Please have ready to share with us, when we request, steps to reproduce and/or a proof of concept (such as a place file or malicious script).

### Discord

You'll need to contact one of our maintainers:

| Rank | GitHub | Discord Username | Discord ID |
| ---- | ----- | ----------------- | ---------- |
| Lead | [@ItsTato](https://github.com/ItsTato) | [@ItsTato](https://discord.com/users/900401428739272725) | `900401428739272725` |

> If one of the usernames above have changed and are no longer accurate, or you want to double check the usernames are correct, you can use the https://discord.id/ lookup service.

Please approach a maintainer, ideally privately but if not then publicly, and inform them that you need to report a Stlr security bug. We'll respond with further instructions so you can deliver your report to us.

If all else fails and you can't get in touch with any maintainer, please open a GitHub issue stating simply you have a security report and you're struggling to get in touch. We can help from there.

> [!WARNING]
> If you attempt to get in touch publicly, you must not disclose or hint at any information pertaining to the contents of your report. Please do not send details privately in a drive-by fashion either; we will tell you, explicitly when to provide information about your report, which will be in a secure channel (usually a private Discord groupchat between you and the maintainers).

## What to expect

After we've received your report, we'll start investigating as soon as possible. We are volunteers at the end of the day.

Your report will be shared with an internal group of trusted contributors and advisers, they'll help us to handle your report and get the issue fixed. We'll do our best to keep you up-to-date with the progress of your report, but can't make any guarantees; you're welcome to infrequently enquire on the status of your report.

We will notify you when we have identified a fix to the vulnerability. You may be invited to confirm that our solution covers the vulnerability adequately.

## Disclosure

We will publish a new release containing the fix and - unless exceptional circumstances apply - a security advisory alongside it. It is possible that this initial advisory is only a summary of the vulnerability and that a more detailed advisory will come later; if we do this, it's to make it harder for opportunists to take advantage of the vulnerability while our users update to the patched version.

We appreciate that recognition is important to researchers and contributors and will provide credit where due. We will advise you when it is appropriate for you to fully disclose and publicly discuss the vulnerability. Ordinarily, this will be when a full advisory has released. We'll then close the groupchat or email thread about your report.

> [!WARNING]
> To protect our users, we ask for you to be discreet. Prior to the publishing of a remediation release, you must **not** publicly discuss any information regarding the vulnerability, and we ask you to be mindful of who you discuss the vulnerability with.

## Guidance

You **must NOT**:

- break the law or violate anyone's copyright
- attempt attacks on games unless you have their permission
- release information about a vulnerability without our permission
- demand financial compensation in order to report any vulnerabilities

We will **not** consider reports which:

- detail non-exploitative or hypothetical vulnerabilities: please conduct appropriate testing and demonstrate a proof of concept or reproduction steps
- indicate that the library does not fully align with "best practice" without identifying a specific vulnerability
- detail vulnerabilities that require the execution of server-sided code
- detail vulnerabilities that only have client-sided impact; for instance, bypassing hooks or guards on a client-only command
- vulnerabilities which do not affect the latest released version of Stlr or the 'mainline' version (the current code on the main branch)
- do not relate to the Stlr library; for example, a bug in example code we provide on our website/Discord or a bug which only affects a downstream project or game that uses/depends on Stlr. In the case of downstream vulnerabilities, you should report these to them directly.

Generally speaking, reports peratining to things like Denial of Service, rate limiting, and spam are unlikely to be considered unless these have side effects which can create a vulnerability (fictional example: spamming a hook-restricted command 100,000 times will let you bypass the hook).

If something is out of scope, you are welcome to open a GitHub Issue and report it as a bug. Out of scope doesn't mean it won't be fixed or it's not a problem, just that it's not a security vulnerability requiring a fast response.

If you've identified a potential vulnerability in a pull request which hasn't been merged, please note it in that pull request. If it has been merged, report it like any other vulnerability.

## Legalities

This policy is designed to be compatible with common vulnerability disclosure good practice. It does not give you permission to act in any way that is inconsistent with the law, or which might cause us or our users to be in breach of any legal obligations.

Since we don't own the games Stlr runs in, we usually do not have the standing to seek charges for computer intrusion or abuse offences. Accordingly, we can't provide any type of indemnity; you should refer to the policies of Roblox and any game you intend to conduct testing against (if not your own).

**Nothing in this policy is legal advice. Nothing in this policy is legally binding (e.g. a contract).**
