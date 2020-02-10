require 'streamio-ffmpeg'
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
FFMPEG.logger = logger

output = '/output'

files = Dir.glob('/input/*.{mp3,m4a,wma}').sort

files.each_with_index do |file, index|
  filename = File.basename(file, '.{mp3,m4a,wma}')
  wav_filename = "#{filename}.wav"
  output_file = File.join(output, "#{index}.WAV")

  audio = FFMPEG::Movie.new(file)
  audio.transcode(wav_filename, %w(-acodec pcm_u8 -ar 22050))

  command = "sox --buffer 131072 --multi-threaded --no-glob \"#{wav_filename}\" --clobber -r 32000 -b 16 -e signed-integer --no-glob #{output_file} remix - gain -n -1.5 bass +1 loudness -1 pad 00"

  logger.info("Running audio processing...\n#{command.split(' ')}\n")
  system(command)
  logger.info("Audio processing of #{wav_filename} to #{output_file} succeeded\n")

  logger.info("Deleting intermediate output #{wav_filename}...\n")
  system("rm \"#{wav_filename}\"")
end
