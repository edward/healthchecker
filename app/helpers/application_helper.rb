module ApplicationHelper
  def colour_chunks(handle)
    raw_colour_chunks = handle.split('-').map { |chunk| chunk.to_i(16) }
    colours = raw_colour_chunks.map do |raw_colour_chunk|
      colour = raw_colour_chunk % (256*256*256)
      {
        red: (colour>>16) & 0x0ff,
        green: (colour>>8) & 0x0ff,
        blue: (colour) & 0x0ff,
      }
    end
  end
end
