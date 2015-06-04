desc "Run lint (Rubocop)"
task :lint do
  sh "/var/lib/gems/1.9.1/bin/rubocop --require rubocop/formatter/checkstyle_formatter "\
     "--format RuboCop::Formatter::CheckstyleFormatter --out tmp/checkstyle.xml"
end
