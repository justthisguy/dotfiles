class Insert < Thor
  include Thor::Actions

  desc "into TEXT FILE", "Insert text into a file"
  def into( file, text )
    insert_into_file( file, text )
  end

  desc "before TEXT FILE BEFORE", "Insert text into a file before specified text"
  def before( file, text, regex_str )
    regex = Regexp.new(regex_str.gsub(%r{^/|/$}, ''))
    insert_into_file( file, text, before: regex )
  end

  desc "after TEXT FILE", "Insert text into a file after specified text"
  def after( file, text, regex_str )
    regex = Regexp.new(regex_str.gsub(%r{^/|/$}, ''))
    insert_into_file( file, str, after: regex )
  end
end

