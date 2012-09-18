require 'ruboto/widget'
require 'ruboto/util/stack'
require 'ruboto/util/toast'
require 'config'

ruboto_import_widgets :Button, :LinearLayout, :TextView

class SqliteActivity

   def on_create(bundle)
    super
    set_title 'My First Ruboto Application with sqlite'
    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => 'List of People', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 25.0
          with_large_stack{@people = Person.order(:name).all}
          @people.each do |p|
          button :text => p.name , :width => :match_parent, :id => 43, :on_click_listener => proc { display_dob(p.id) }
          end
        end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

end
  

  def on_resume

  end


with_large_stack do
  Person.delete_all
  Person.create :name => 'Heurion',:birthdate => "2012-05-14"
  Person.create :name => 'Khaja',:birthdate => "2015-09-10"
  Person.create :name => 'Venketesh',:birthdate => "20182-09-17"
  Person.create :name => 'Sreedavi',:birthdate => "2012-09-18",:birthdate => "2017-8-18"
  Person.create :name => 'Aruna',:birthdate => "2072-04-18"
  Person.create :name => 'Lakhami',:birthdate => "2012-07-18"
end
  
  private

  def display_dob(id)
    p=Person.find(id)
    @text_view.text = "#{p.name} birthday is #{p.birthdate}"
    toast "Loading #{p.name} details..."
  end