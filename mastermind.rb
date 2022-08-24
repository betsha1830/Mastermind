class MasterMind

    def initialize

    end

    def random_color_generator
        random_color = ""
        random_num = Random.new()
        until random_color.size == 4
            random_color += (random_num.rand(6) + 1).to_s
        end
        random_color
    end

end

mind = MasterMind.new
puts mind.random_color_generator