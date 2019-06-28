namespace :utf8mb4 do
  desc 'Change character set for tables to UTF8MB4'
  task migrate_tables: :environment do
    Rails.application.eager_load! if Rails.env.development?

    table_names = ActiveRecord::Base.descendants.map(&:table_name).compact

    ActiveRecord::Base.transaction do
      table_names.each do |table_name|
        varchar_columns = ActiveRecord::Base.connection.execute(
          <<-EOF
            SELECT COLUMN_NAME, COLUMN_DEFAULT, IS_NULLABLE
            FROM information_schema.columns
            WHERE
              TABLE_SCHEMA="#{ActiveRecord::Base.connection_config[:database]}"
              AND TABLE_NAME="#{table_name}"
              AND DATA_TYPE="varchar"
              AND CHARACTER_MAXIMUM_LENGTH=255
          EOF
        ).to_a

        varchar_columns.each do |column_name, column_default, is_nullable|
          ActiveRecord::Base.connection.execute "ALTER TABLE `#{table_name}` MODIFY `#{column_name}` VARCHAR(255) #{'NOT ' if is_nullable == 'NO'}NULL#{" DEFAULT \"#{column_default}\"" if column_default}"
        end

        ActiveRecord::Base.connection.execute "ALTER TABLE `#{table_name}` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
      end
    end
  end
end
