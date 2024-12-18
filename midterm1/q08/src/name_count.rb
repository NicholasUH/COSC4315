def count_names_by_first_letter(names)
  names
    .reject(&:empty?)
    .map { |name| name[0].upcase }
    .tally
    .sort.to_h 
end


def format_counts(counts)
  return "No names provided." if counts.empty?
  counts.map { |letter, count| "#{letter}: #{count}" }.join(", ")
end


def main
  lists_of_names = [
    [],
    ["Tom", "Jerry"],
    ["Dory", "Jack", "Theo", "Darla", "Bruce", "Marlin", "Bob", "Jacques", "Bill", "Zack"],
    ["Jim", "Jorge", "Jill", "Jim", "John", "Joe"]
  ]

  lists_of_names.each_with_index do |names, idx|
    formatted_output = format_counts(count_names_by_first_letter(names))
    puts "List #{idx + 1} Output: #{formatted_output}"
  end
end

main if __FILE__ == $0
