# Jingle Punks Developer Exam

We're really excited that you've made it this far in the process!  
The resources you'll find in this repo will help you answer the following questions:

## HAML
Over 86% of our markup is haml so it'll be important to get up to speed with haml as soon as possible.  I've added rendered markup from our [contact page](http://www.jinglepunks.com/contact).

*  Convert **./haml/contact.html** into **./haml/contact.html.haml**

## SQL
We're a MySQL shop so this test is MySQL centric.  The './sql/setup.sql' file contains 'creates' and 'inserts' that only work for MySQL databases.  
Also, though questions (1) & (2) are standard SQL questions, question (3) must be answered for MySQL databases.

** _If you're a Postgres user, you'll have to perform your own translations to get the schema into your local db._ **

Based on the schema & data ...

1) Find the users who are either a 'writer' or an 'editor' (You can only use the keyword 'SELECT' once):

REQUIRED OUTPUT COLUMNS:

*  user id,
*  first name,
*  last name,
*  role name,
*  state

2) Find the count of all users WITHOUT addresses that are 'writers' and have '9' in their 'first_name' (You can only use the keyword 'SELECT' once):

REQUIRED OUTPUT COLUMNS:

*  'homeless writers'

3) Add indexes that would make the query in question 2 run faster.


## RAILS
The models in this folder correspond to the database we created in the SQL section.  Please perform the following tasks and add your work to the ./rails folder:

1) Create **2** Named Scopes that, when **chained**, can return all 'admins' that live in a specific state.
Here are some example result sets the scopes should be able to get:

*  Scope1: All of the 'writers'
*  Scope2: Everyone that lives in 'FL'
*  Scope1 + Scope1: All of the 'editors' that live in 'MA'

2) Add validation on the Address model.  

*  We should only create an Address record if the zip code contains 5 numbers.

3) Write 2 **UNIT** tests to confrim that your validation in Question(2) works.  Those test should...

*  Confirm that **VALID** records **PASS** validation and **CAN** be created.
*  Confirm that **INVALID** records **FAIL** validation **CANNOT** be created.

4) The relationship between Users and Roles is pretty limited.  

*  Update the relationship in 'user.rb' & 'role.rb' to allow a single user to have multiple roles.  
*  Create any new files you'll need.

5) Write a data migration script (in Ruby or SQL) that updates the existing records in the database to use the new code you created in Question (4).


## BONUS RUBY QUESTION

**You don't have to answer this one, but if you wanted to, it'd be cool :)**

Create a ruby deamon that monitors a domain (ex: www.google.com) in ./ruby .  It should... 

*  Ping every 5 seconds.  
*  If the script doesn't get the response it expects, it should email 'admin@google.com'.  
*  **For Bonus Bonus Points:**  Report the isssue via growl using the 'ruby-growl' gem instead of sending an email.
