# Notebook app

## Description
This is a notebook project, so you can create a notebook, and you can create pages inside this notebook.
Inside a page, you can set an emoji by selecting one category of the list.

## Usage
First, download the repo or clone it into your local machine.
Once you have de projecto into your local machine, run the next commands so you can download all dependencies of the project:
`bundle install`
This command will install all the missing depencies. Afeter thta, you may to update the `database_template.yml` file with your local database credentials.
Next you have to run the `rails db:create` command to create the database and then the `rails db:migrate` to execute all the migrations.

If everything goes ok, just run the `bin/dev` command, if you run `rails s` command, you will have to start tailwdin manually.

## Images of the project
- Root view
![Screenshot from 2025-04-11 20-17-19](https://github.com/user-attachments/assets/254d4705-c2d7-4936-be0f-be3a3c3480b0)

- notebook view
![Screenshot from 2025-04-11 20-19-37](https://github.com/user-attachments/assets/b063f060-30db-4d58-87e2-78b22c97e983)

- pages view
![Screenshot from 2025-04-11 20-20-11](https://github.com/user-attachments/assets/2f342834-c651-440e-8f9a-27c266057e95)
