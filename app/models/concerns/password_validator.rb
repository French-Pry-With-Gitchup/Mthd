class PasswordValidator < ActiveModel::Validator
    @Current_Error = ""

    # Checking the Character Types
    def validate(record)
        unless validation_check(record.password) == true 
            record.errors.add :password, "Error: #{@Current_Error}" # Gives a Custom Error depending on what the User did Wrong.
        end
    end

    # Do Checks for Length of String    | Min: 4 
    def text_character_check(password)
        if password =~ /^[A-Za-z0-9!@#%&\*\$\^]+$/
            true
        else
            @Current_Error = "Incorrect Characters entered, must use Letters(Uppercase/Lowercase), Numbers, or the following Characters (!, @, #, %, &, *, $, ^)!"
            false
        end
    end

    # Checking the Length of the String
    def text_length_check(password)
        if password.length > 5						               # Do Checks for Length of String	| Min: 4 
            true
        else
            @Current_Error = "Your password is too short, please enter more than 5 characters!"
            false
        end
    end

    # Checking for Character Concurrency
    def concurrency_check(password)
        if password.count("0-9") >= 1	&& password.count("a-zA-Z") > 4 && password.count("!@#%&*$^") >= 1 # Checks if the password is properly 
            true
        else
            @Current_Error = "You need to have a Number, more than 4 Letters, and at least 1 Special Character!"
            false
        end
    end

    # Validate Name through a series of checks
    def validation_check(password)
        if text_length_check(password) && text_character_check(password) && concurrency_check(password) 
            true
        else
            false
        end
    end

end

