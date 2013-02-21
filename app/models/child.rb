module Child
  class Child < ActiveRecord::Base
    attr_accessible :name, :type, :parent_id
    belongs_to :parent
  end

  class AutosaveChild < Child
  end

  class NotAutosaveChild < Child
  end

  class DefaultChild < Child
  end
end
