# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ===========================================================
# デフォルトで入っていたもの
# ===========================================================
ruby '2.7.5'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.6'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

# ===========================================================
# 言語変換
# ===========================================================
gem 'rails-i18n'

# ===========================================================
# modelのcolumn名の表示
# ===========================================================
gem 'annotate'

# ===========================================================
# 時間系
# ===========================================================
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# ===========================================================
# heroku環境
# ===========================================================
gem 'net-imap'
gem 'net-pop'
gem 'net-smtp'

# ===========================================================
# 開発/テスト環境のみ
# ===========================================================
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

# ===========================================================
# 開発環境のみ
# ===========================================================
group :development do
  gem 'listen', '~> 3.3'
  gem 'pry-rails'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', require: false # 生Rubyに関わる構文規則チェック,falseにすることでbundlerによってRailsアプリ側に自動で読み込みされないようにな
  gem 'rubocop-performance', require: false # パフォーマンスに関わる構文規則チェック
  gem 'rubocop-rails', require: false  # Railsに関わる構文規則チェック
  gem 'rubocop-rspec', require: false  # クラスやメソッド単位でテスト
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

# ===========================================================
# テスト環境のみ
# ===========================================================
group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end
