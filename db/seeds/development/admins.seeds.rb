ADMINS_COUNT = 15

admin_progressbar =
  ProgressBar.create \
    title: 'Create admins',
    total: ADMINS_COUNT,
    format: '%t %B %p%% %e'

admins =
  [].tap do |a|
    ADMINS_COUNT.times do |n|
      a << FactoryGirl.build(:admin)
      admin_progressbar.increment
    end
  end

AdminApp::Admin.import admins, validate: false
