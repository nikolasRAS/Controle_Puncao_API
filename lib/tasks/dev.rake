namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    show_spinner(I18n.t('dev.destroy_db')) {%x(rails db:drop:_unsafe)}
    show_spinner(I18n.t('dev.create_db')) {%x(rails db:create)}
    show_spinner(I18n.t('dev.migrate_db')) {%x(rails db:migrate)}
    %x(rails dev:add_age_ranges)
  end

  desc "Create age ranges"
  task add_age_ranges: :environment do
    show_spinner(I18n.t('dev.create_age_range.other')) do
      
      spinner = TTY::Spinner.new("[:spinner] #{I18n.t('dev.create_age_range.other')}...", format: :dots_10)
      spinner.auto_spin

      age_ranges = [ {description: I18n.t('dev.child')}, {description: I18n.t('dev.adult')} ]
      
      age_ranges.each do |age_range|
        AgeRange.find_or_create_by!(age_range)
      end     
    end
  end

  private
  def show_spinner(msg_start, msg_end = I18n.t('dev.finished')) 
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...", format: :dots_10)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end