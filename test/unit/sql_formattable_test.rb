# coding: utf-8
require "test_helper"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define version: 0 do
  create_table :books, force: true do |t|
    t.string :name
    t.string :category
  end
end

class Book < ActiveRecord::Base; end

class SqlFormattableTest < ActiveSupport::TestCase
  def setup
    @old_logger = ActiveRecord::Base.logger
    super
    ActiveRecord::Base.logger = TestLogger.new
  end

  def teardown
    super
    ActiveRecord::Base.logger = @old_logger
  end

  def test_sql_is_formatted
    Book.where(category: "comics").to_a
    logs = ActiveRecord::Base.logger.debugs
    assert_equal "\tSELECT", logs[1]
    assert_equal %{\t\t"books" . *}, logs[2]
    assert_equal "\tFROM", logs[3]
    assert_equal %{\t\t"books"}, logs[4]
    assert_equal "\tWHERE", logs[5]
    assert logs[6].start_with?(%{\t\t"books" . "category" = 'comics'})
  end
end
