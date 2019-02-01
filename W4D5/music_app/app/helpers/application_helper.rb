module ApplicationHelper

    def randomized_background_image
        images = ['1.jpeg', '2.jpeg']
        images[rand(images.size)]
    end
      
end
