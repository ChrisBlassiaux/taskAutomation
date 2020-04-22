
def get_argv
  name_of_folder = ARGV
  abort("Error: enter the name of the folder after the 'mkdiruby' command") if ARGV.empty?
  return name_of_folder.join
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_gemfile(name_folder)
  file = File.open("#{name_folder}/Gemfile", "a")
  file.puts("source 'https://rubygems.org'")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'rspec'")
  file.puts("gem 'pry'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.puts("gem 'nokogiri'")
  file.puts("gem 'open-uri'")
  file.close
end

def initiate_git(name_folder)
  system("git init")
  system("mv .git #{name_folder}")
end

def create_env(name_folder)
  file = File.open("#{name_folder}/.env", "a")
  file.close
end

def create_gitignore_with_env(name_folder)
  file = File.open("#{name_folder}/.gitignore", "a")
  file.puts(".env")
  file.close
end

def create_lib(name_folder)
  Dir.mkdir("#{name_folder}/lib")
end

def create_app_and_views_in_lib(name_folder)
  Dir.mkdir("#{name_folder}/lib/app")
  Dir.mkdir("#{name_folder}/lib/views")
end

def create_base_in_views(name_folder)
  file = File.open("#{name_folder}/lib/views/done.rb", "a")
  file.close
  file = File.open("#{name_folder}/lib/views/index.rb", "a")
  file.close
end

def create_db(name_folder)
  Dir.mkdir("#{name_folder}/db")
  file = File.open("#{name_folder}/db/thing.csv", "a")
  file.close
end

def create_app_rb(name_folder)
  file = File.open("#{name_folder}/app.rb", "a")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts(" ")
  file.puts('$:.unshift File.expand_path("./../lib", __FILE__)')
  file.puts("#require '...' <- fichier/class")
  file.puts(" ")
  file.puts("#MyClass.new.perform <- Appel de class")
  file.puts(" ")
  file.puts("#binding.pry")
  file.close
end

def initiate_rspec(name_folder)
  system("rspec --init")
  system("mv spec #{name_folder}")
  system("mv .rspec #{name_folder}")
end

def create_readme(name_folder)
  file = File.open("#{name_folder}/README.md", "a")
  file.puts("# TASK AUTOMATION")
  file.puts("Generate with Ruby")
  file.close
end

def perform 
  create_folder(get_argv)
  create_gemfile(get_argv)
  initiate_git(get_argv)
  create_env(get_argv)
  create_gitignore_with_env(get_argv)
  create_lib(get_argv)
  create_app_and_views_in_lib(get_argv)
  create_base_in_views(get_argv)
  create_db(get_argv)
  create_app_rb(get_argv)
  initiate_rspec(get_argv)
  create_readme(get_argv)
end

perform
