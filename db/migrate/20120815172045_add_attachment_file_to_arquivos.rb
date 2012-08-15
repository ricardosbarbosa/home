class AddAttachmentFileToArquivos < ActiveRecord::Migration
  def self.up
    change_table :arquivos do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :arquivos, :file
  end
end
