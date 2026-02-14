
Technical Interview

This interview is for a staff or senior level data engineering role. All applicants who make it to this interview stage are assumed to be capable developers with years of development experience. It makes little sense to quiz you on a contrived algorithmic problem, in an unfamiliar and artificial development environment. Instead, we’ve put together this interview in an attempt to give you every opportunity to show off how you work, how you think, and how you solve real-world problems.

To that end: the interview is a full hour long, open book, and runs entirely in your preferred development setup, on your machine. You are free to use whatever AI tools make you the most productive, though your interviewer may ask you to start the process without them rather than allowing a model to one-shot the question on your behalf. You may Google whatever you need to Google, and the libraries and technologies in use are shared with you ahead of time, right here.  DBT and SQL skills are a small but foundational subset of the technical skills required for this role. 

Preparing your dev environment

We’ve made an effort to ensure that setup is seamless and fast, but everyone’s dev environment is a little different. The time from clone to a working setup among our internal testers was 1-4 minutes on both Linux and Mac machines - likely less time than it takes to read this document!

To prepare for the interview, you will need a development environment (local or VM) capable of running a limited set of basic data engineering software. If you can get to the point of successfully running `dbt debug` and `dbt run` either natively or in a docker container using this test repo, you are good to go. If you can’t, please reach out with a description of the problem and we’ll try to get it working so that you are set up for success during the interview.

During the interview, you will be asked to share (at minimum) an IDE window with your interviewer. If you are comfortable doing so, it may be helpful to share your entire screen to give your interviewer full context for how you work. Again - there are no restrictions on the tools you use during the interview. You will not be penalized for Googling or using AI tools, but you do need to be doing the work unaided by other humans. 

Accessing the Private Interview Repository

About 15 minutes before the interview, you should receive an email with an SSH private key and a link to a private GitHub repository. The key is a GitHub ed25519 deploy key, unique to you and our interview repo. Configured appropriately on your machine, it will temporarily allow you to clone the repo. There are instructions for key setup and cloning in [How to Clone the Repo](./How%20To%20Clone%20the%20Repo.md). 

If you respond to this email with a GitHub handle you’d like us to use, we will instead invite you as a collaborator on the interview GitHub repo. 

Interview Format:

~10 minutes: 
Learn a bit about the structure of the data and code in the repo. Describe what you see and how you are reasoning about it to your interviewer.

40-45 minutes: 
Your interviewer will present you with one or more problem statements from end users in the business. Your task will be to address the user’s problem by modifying the code in the repository, then explain to the end user how your fix addresses the issue.

5-10 minutes:
Your interviewer will recap what happened in the interview from their notes and give you the opportunity to address any omissions or errors in their understanding. If time permits, we like to reserve a bit of time for candidate questions and feedback after the recap.

Thank you for the time, and I look forward to meeting with you!
