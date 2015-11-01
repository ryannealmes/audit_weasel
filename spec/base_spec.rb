require 'spec_helper'

# Tests the audit fields are updating correct.
# An in memory database is created before each test and a
# dummy model is extended with the auditing functionality.
module AuditWeasel
  describe Base do
    before do
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3',
                                              database: ':memory:')

      ActiveRecord::Schema.define do
        create_table :articles do |t|
          t.string :text
          t.integer :created_by_user_id
          t.integer :updated_by_user_id
        end
      end

      class Article < ActiveRecord::Base
      end

      ActiveRecord::Base.send(:include, AuditWeasel::Base)

      AuditWeasel::RequestRegistry.current_user = double(:user, id: 6)

      article = Article.new(text: 'change')
      article.save
    end

    it 'sets the created_by_user_id when creating the record' do
      expect(Article.first.created_by_user_id).to eq(6)
    end

    it 'sets the updated_by_user_id when creating the record' do
      expect(Article.first.updated_by_user_id).to eq(6)
    end

    it 'sets the created_by_user_id when created an empty record' do
      article = Article.create
      expect(article.created_by_user_id).to eq(6)
    end

    it 'sets the updated_by_user_id when created an empty record' do
      article = Article.create
      expect(article.updated_by_user_id).to eq(6)
    end

    it 'updates the user who updated the record' do
      AuditWeasel::RequestRegistry.current_user = double(:user, id: 7)

      article = Article.first
      article.text = 'ping'
      article.save

      expect(Article.first.updated_by_user_id).to eq(7)
    end

    it 'does not update the created_by_user_id when updating an existing record' do
      AuditWeasel::RequestRegistry.current_user = double(:user, id: 7)

      article = Article.first
      article.text = 'ping'
      article.save

      expect(article.created_by_user_id).to eq(6)
    end
  end
end
