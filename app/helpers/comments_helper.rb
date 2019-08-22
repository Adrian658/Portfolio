module CommentsHelper

    def sort_comments comments
        comments.sort { |a, b| b <=> a }
    end

end
