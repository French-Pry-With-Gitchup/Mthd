class NameValidator < ActiveModel::Validator
    # Checking the Character Types
    def validate(record)
        unless validation_check(record.name) == true
            record.errors.add :name, "Incorrect" 
        end
    end

    def text_character_check(name)
        if name =~ /^[A-Za-z0-9_\.]+$/		 				   # Do Checks for Amount of characters in String	| Min: 4
            true
        else
            false
        end
    end

    # Checking the Length of the String
    def text_length_check(name)
        if name.length > 4									    # Do Checks for Length of String	| Min: 4 
            true
        else
            false
        end
    end

    # Checking for Character Concurrency
    def concurrency_check(name)
        if name.count('.') < 2	&& name.count("a-zA-Z") > 4 	# Do Checks for Amount of periods in String and Characters in String    | Max: 1 && Max: 4
            true
        else
            false
        end
    end

    # Validate Name through a series of checks
    def validation_check(name)
        if text_character_check(name) && concurrency_check(name) && text_length_check(name)
            true
        else
            false
        end
    end
end

