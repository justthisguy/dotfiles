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

### examples
# thor insert:after "app/views/layouts/application.html.erb"  "A$(echo -e '\n\n\n\n')Z"  "$(echo -e '/<main [\w=\" -]+>\n/')"
# thor insert:after "app/views/layouts/application.html.erb"  "      <div><%= render 'layouts/alert'%></div>/\n"  "$(echo -e '/<main [\w=\" -]+>\n/')"
# thor insert:after "app/views/layouts/application.html.erb"  "      <div><%= render 'layouts/alert'%></div>$(echo -e '\n')"  "<main [\w=\" -]+>\n"
# thor insert:after "app/views/layouts/application.html.erb"  "  <div><%= render 'layouts/alert'%></div>$(echo -e '\n')"  "$(echo -e '</head>')"
# thor insert:before "app/views/layouts/application.html.erb", "ADDITIONAL", "<main"
# thor insert:into "app/views/layouts/application.html.erb", "ADDITIONAL"
# thor insert:after "application.html.erb", "  <div><%= render 'layouts/alert'%></div>$(echo -e '\n')", "$(echo -e '/<main [\w=\" -]+>\n/')"
# thor insert:before "Rakefile" "this is quux" "$(echo -e '\nrequire_relative')" "$(echo -e '\n')"
