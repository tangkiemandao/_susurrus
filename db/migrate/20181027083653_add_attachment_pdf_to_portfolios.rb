class AddAttachmentPdfToPortfolios < ActiveRecord::Migration[5.1]
  def self.up
    change_table :portfolios do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :portfolios, :pdf
  end
end
