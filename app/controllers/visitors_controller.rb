class VisitorsController < ApplicationController

  def new
	@post = Post.all.last(6)
	@category = Category.all
	prepare_meta_tags(title: "Home")
  end
  
  def download
	prepare_meta_tags(title: "Download Pokemon Go", description: "Here you can easily download newest, secure version of Pokemon Go game.")
  end
  
  def items
	prepare_meta_tags(title: "Items in Pokemon Go", description: "Read about all known items in new Niantec Game - Pokemon Go. Learn how and when you can get special items.")
  end
  
  def faq
	prepare_meta_tags(title: "FAQ", description: "If you have any problem with Pokemon Go just check this page, if someone had any questions about game we replied here.")
  end
  
  def technicalfaq
	prepare_meta_tags(title: "Technical FAQ", description: "Is your phone supported by Pokemon Go? Is your system in good version? Everything about this here.")
  end
  
end
