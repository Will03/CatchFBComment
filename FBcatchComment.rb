require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'pry-byebug'
include Capybara::DSL
options = {
 :window_size => [1280, 800],
 :js_errors => false

}
Capybara.javascript_driver = :poltergeist
Capybara.current_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
Capybara::Poltergeist::Driver.new(app, options)
end
url = ARGV[0]
puts url
visit(url)
opencommnet = find('div._3399._1f6t div._524d span._2u_j:first-child')
opencommnet.click
commectnum = 0

while(page.has_selector?('div.UFIRow.UFIPagerRow._4oep._48pi div.clearfix div a.UFIPagerLink'))
	find('div.UFIRow.UFIPagerRow._4oep._48pi div.clearfix div a.UFIPagerLink').trigger('click')
sleep(1)
end

while(page.has_selector?('div.UFIRow.UFIPagerRow._4oep.UFILastCommentComponent._2o9m div.clearfix div a.UFIPagerLink'))
	find('div.UFIRow.UFIPagerRow._4oep.UFILastCommentComponent._2o9m div.clearfix div a.UFIPagerLink').trigger('click')
sleep(1)
end
comCommentData = []
comcomment = all('div.UFIReplyList')
x = 0
comcomment.each do |i|
	
		comCommentTemp = i.all('div._3b-9')
		comCommentTemp.each do |j|
			comCommentData[x] = j
			x+=1
			#puts j.text
		end


end
puts comCommentData.count
sleep(3)
#file = File.open("fbcomment.txt", "w")
puts "First comment"
ccnum = 0
pageComment = all('div.UFIRow.UFIComment._4oep')
pageCommentNum = pageComment.count-1
puts pageCommentNum
(commectnum..pageCommentNum).each do |i|
	if(ccnum>=comCommentData.count)
		data = pageComment[i].all('div.UFICommentContent span')
		#file.puts data[0].text+" "+data[2].text
		puts data[0].text+" "+data[2].text

	else
		if (comCommentData[ccnum].text != pageComment[i].text)
		
			data = pageComment[i].all('div.UFICommentContent span')
			#file.puts data[0].text+"\n"+data[2].text
			puts data[0].text+" "+data[2].text
		else
			ccnum+=1
		end
	end

end
#file.close
sleep(3) 
