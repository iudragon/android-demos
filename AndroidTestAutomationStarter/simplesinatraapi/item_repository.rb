require_relative 'item'
require 'faker'

class ItemRepository

  def initialize
    @items = { '3': [
        Item.new(1, 'Hat Green', '$18', 'hat1', get_random_description(4)),
        Item.new(2, 'Hat Black', '$12', 'hat2', get_random_description(2)),
        Item.new(3, 'Hat White', '$11', 'hat3', get_random_description(3)),
        Item.new(4, 'Hat Blue', '$29', 'hat4', get_random_description(1)),
    ],
              '2': [],
              '1': [],
              '4': []}
  end

  def items_from_category(category)
    @items[category]
  end

  def get_random_description(number_of_sentences)
    Faker::Hipster.sentences(number_of_sentences).join(' ')
  end

  def get_item_for_id(item_id)
    @items.each do |category, items_in_category|
      p "category id = #{category}"
      items = items_in_category.find_all {|item|
        item.id == item_id.to_i}
      return items[0]
    end
  end
end

