# Intro

iKnow is a download and run Java application that allows you to generate a FAQ site simple and easy.
It is developed with Java EE, Vue.js and MySql.

# Backend

## Database preparation

To properly run iKnow is necessary to have 3 tables:
- "admins" -> Used to save all the admin logins
- "categories" -> Used to save all the possible categories of the questions
- "questions" -> Used to save the questions itself

*It is important to maintain the order of the columns within the table as shown below,  for the correct operation of the application.

## Modeling tables

- admins

The admin table is used to sign in into iKnow backoffice.
The properties fot this table are:

| Field  | Type | Null  | Key | Default  | Extra |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| admin_id  | int(11)    | No  | PRI  | NULL  | auto_increment |    
| user  | varchar(255)   | No  |   | NULL  |  |    
| password  | varchar(255)   | No  |   | NULL  |  |    


- categories

The categories table is used to save all the possible categories of the questions

| Field  | Type | Null  | Key | Default  | Extra |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| id  | int(11)    | No  | PRI  | NULL  | auto_increment |    
| name  | varchar(255)   | No  |   | NULL  |  |    
| iconCode  | varchar(255)   | No  |   | NULL  |  |    

*iconCode -> The iconCode works with any third service which provides icon (i) tags with specific classes, like FontAwesome or Material Icons.
The content of the iconCode field should the HTML class which will be used inside the icon (i) tag.
So, for the icon `<i class="fas fa-address-card"></i>`, only the text "fas fa-address-card" should be submitted in the iconCode field.


- questions

| Field  | Type | Null  | Key | Default  | Extra |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| questionId  | int(11)    | No  | PRI  | NULL  | auto_increment |    
| title  | varchar(255)   | No  |   | NULL  |  |    
| content  | varchar(1000)   | No  |   | NULL  |  |    
| categoryId  | int(11)   | No  | MUL   | NULL  |  |    

*content -> The space for this field can be greater than 1000.


## DB configuration

Start configuring the Java class file for the DB connection. Go into `/src/java/com/iknow/connectionDb.java` and write down your DB info
- 'db_url': 'host of the DB',
- 'db_base': 'database name',
- 'db_user': 'user for the DB',
- 'db_pass': 'pass for the DB'

# Ready to go

Since this DB configuration has been made, the application is ready to be builded as a JAR/WAR file and to be uploaded into your server.
Once you have launched the application, you can start submitting Categories and Questions in the backoffice.
All the categories will be loaded in the home page.
And all the questions of every category will be loaded in the category route.
As easy like that.

# Frontend

## Routes

- The route to login into the backoffice is `/login.jsp` 
- The route to access a category is `/category/?title=` and the GET request for the category to search.
- The route to access a question is `/question/?id=` and the GET request for the question to search.

## Sources files configuration

    -JS
The javascript part of this application works with Vue.js and Webpack.
The JS sources files can be found in: `/web/assets/js/sources/`
And the bundled files should placed in: `/web/assets/js/`
The relation between files is:
- 'home.js' -> 'bundle.js'
- 'category.js' -> 'bundleCategory.js'
- 'question.js' -> 'bundleQuestion.js'

    -CSS
The CSS part of this application works with SASS technology.
It also works with Bootstrap framework. Which can be modified in: `/web/assets/css/bootstrap.min.css`
The SASS sources files can be found in: `/web/assets/scss/`
And the compiled file should be placed in: `/web/assets/css/styles.css`


# Further help

Any issue, bug or comment can be submitted in this repo.
