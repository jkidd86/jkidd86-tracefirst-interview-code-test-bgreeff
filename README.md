```ascii
  _______                      ______  _             _   
 |__   __|                    |  ____|(_)           | |  
    | | _ __  __ _   ___  ___ | |__    _  _ __  ___ | |_ 
    | || '__|/ _` | / __|/ _ \|  __|  | || '__|/ __|| __|
    | || |  | (_| || (__|  __/| |     | || |   \__ \| |_ 
    |_||_|   \__,_| \___|\___||_|     |_||_|   |___/ \__|
                                                         
```                                                                                 

# 𝖳𝗋𝖺𝖼𝖾 𝖥𝗂𝗋𝗌𝗍 – 𝖱𝖺𝗂𝗅𝗌 𝖨𝗇𝗍𝖾𝗋𝗏𝗂𝖾𝗐 𝖢𝗈𝖽𝖾 𝖳𝖾𝗌𝗍

[![CI](https://github.com/jkidd86/jkidd86-tracefirst-interview-code-test-bgreeff/actions/workflows/ci.yml/badge.svg)](https://github.com/jkidd86/jkidd86-tracefirst-interview-code-test-bgreeff/actions/workflows/ci.yml)

Welcome 👋

This is a small Rails 8 application used as part of the Trace First technical interview process.

Please read this document fully before starting.



| ‣ 𝙊𝙫𝙚𝙧𝙫𝙞𝙚𝙬 |
|--------------|

This exercise is designed to evaluate:

* Code clarity and structure
* Test quality and coverage
* Ability to follow requirements
* Git workflow and pull request hygiene
* Thoughtfulness in code review



> [!IMPORTANT]
> You do **not** need to complete everything. We value quality over quantity. </br>
> Please limit yourself to **a maximum of one hour**.



| ‣ 𝙏𝙚𝙘𝙝𝙣𝙞𝙘𝙖𝙡 𝙍𝙚𝙦𝙪𝙞𝙧𝙚𝙢𝙚𝙣𝙩𝙨 |
|---------------------|

Ensure you have the following installed:

* Ruby **3.2.x**
* Rails **8**


If you use a version manager (rbenv, rvm, asdf), we recommend switching to the required Ruby version before setup.



| ‣ 𝙂𝙚𝙩𝙩𝙞𝙣𝙜 𝙎𝙩𝙖𝙧𝙩𝙚𝙙 |
|---------------|

Clone the repository and run:

```bash
# Install Ruby dependencies
bundle install

# Setup the database
bundle exec rails db:setup

# Build CSS (if required)
bin/rails dartsass:build

# Install git hooks
bundle exec lefthook install

# Start the server
rails s
```

Visit:

```
http://localhost:3000
```



| ‣ 𝙂𝙞𝙩 𝙃𝙤𝙤𝙠𝙨 |
|-------------|

This project uses [Lefthook](https://github.com/evilmartians/lefthook) for pre-commit checks. After `bundle install`, run `bundle exec lefthook install` to activate.

On each commit, the following checks run automatically:

* **RuboCop** – lint staged `.rb` files
* **Brakeman** – static security analysis
* **Bundler Audit** – check gems for known vulnerabilities
* **Importmap Audit** – check JS dependencies for known vulnerabilities

These match the CI pipeline, so if your commit passes locally it should pass CI.

To skip hooks for a single commit: `LEFTHOOK=0 git commit`



| ‣ 𝙂𝙪𝙖𝙧𝙙 |
|-------------|

Auto-runs matching tests when model or controller files change:

```bash
bundle exec guard
```

System tests are excluded — run manually with `bundle exec rails test:system`.



| ‣ 𝙏𝙝𝙚 𝙀𝙭𝙚𝙧𝙘𝙞𝙨𝙚 |
|-------------|

1. Open issues can be found here:

```
/issues
```

2. Create a new branch.
3. Implement the requested changes.
4. Add tests verifying expected behavior.
5. Open a pull request.



> [!NOTE]  
> If you run out of time: <br/>
> Leave a comment on the issue explaining how you would complete it.


| ‣ 𝘾𝙤𝙙𝙚 𝙍𝙚𝙫𝙞𝙚𝙬 𝙏𝙖𝙨𝙠 |
|------------------|

There is an open pull request in the repository.

Please:

* Review it as if you were reviewing a teammate’s work.
* Leave constructive feedback directly on the PR.

We are evaluating:

* Clarity of communication
* Ability to spot edge cases
* Code quality awareness
* Understanding of Rails conventions
* Testing considerations



| ‣ 𝘿𝙚𝙛𝙞𝙣𝙞𝙩𝙞𝙤𝙣 𝙤𝙛 𝘿𝙤𝙣𝙚 |
|-----------------|

A task is considered complete when:

* The feature works as described
* Tests pass
* Code is clear and maintainable
* No obvious regressions are introduced

---



Thank you for taking the time to complete this exercise — we appreciate the effort.
