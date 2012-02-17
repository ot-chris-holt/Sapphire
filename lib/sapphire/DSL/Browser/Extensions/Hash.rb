class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def Show(item, modifier)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            val = x.Equals(arg)
            if (modifier.Modify(val.left, val.right))
              val
            end
          }
        rescue
          x = Evaluation.new(arg, control.Text)
          return x
        end

        return evaluation
     end
  end

  def Contain(item, modifier)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            val = x.Contain(arg)
            if modifier.Modify(val.left, val.right)
              return val
            end
          }
        rescue
          begin
            x = Evaluation.new(arg, control.Text)
            return x
          rescue
            return FieldNotFoundEvaluation.new(item, $page)
          end
        end

        return evaluation
     end
  end

  def Count(item, modifier)
    ExecuteHashAgainstControl(item) do |control, arg|
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      count = 0
      begin
        evaluation = wait.until { x = control
          count = x.Count
          if modifier.Modify(x.Count, arg)
            x = Evaluation.new(arg, count)
            return x
          end
        }
      rescue
        x = Evaluation.new(arg, count)
        return x
      end

      return evaluation
    end
  end

  def In(item, modifier)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            return x.In(arg, modifier)
          }
        rescue
          x = Evaluation.new(arg, control.Text)
          return x
        end

        return evaluation
     end
  end


  def Validate(hash)
    Evaluation.new(hash.keys.first.to_s, hash[hash.keys.first].to_s)
  end

  def Error(item, modifier)
    ExecuteHashAgainstControl(item) do |control, arg|
       return control.Equals(arg, modifier)
     end
  end
end