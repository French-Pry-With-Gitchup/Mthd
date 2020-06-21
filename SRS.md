# Software Design Sheet

## Starting Up The following is Done

1. rails g resource user name:string password:string

2. rails g resource category name:string language:string description:text user_id:integer

3. rails g snippet title:string code:text user_id:integer is_private:boolean

## Making the User and Password Auth System

1. Developing the User CRU System

    * Making the Show/New/Index | .html.erb pages
    * Inside our UserController making [Index, Show, New, Create]
