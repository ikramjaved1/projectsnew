class MyValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.start_with? 'X'
          record.errors.add :title, "Need a name starting with X please!"
        end
      end
    end

    class Person
        include ActiveModel::Validations
        validates_with MyValidator
     end