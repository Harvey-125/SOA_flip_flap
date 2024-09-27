# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  NEWLINE = "\n"
  TAB = "\t"

  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    @data ||= []
    # split the tsv string
    lines = tsv.strip.split(NEWLINE)
    # take headers
    headers = lines.shift.split(TAB)
    # for each line
    lines.each do |line|
      values = line.split(TAB)
      @data.push(headers.zip(values).to_h)
    end
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    # take headers
    headers = @data.first.keys
    tsv_string = headers.join(TAB) + NEWLINE # add headers to string
    # transfer each key-value to tsv
    @data.each do |hash|
      tsv_string += hash.values.join(TAB) + NEWLINE
    end
    tsv_string
  end
end
