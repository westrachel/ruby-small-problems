# Create a Madlibs Program that reads in story text from a different file:

# Code:
text = File.open("madlibs_template.txt")

# read the text file's contents and remove new line characters
story = text.readlines.map(&:chomp)

p story.join(' ').is_a?(String)
# => true
story = story.join(' ')

VERBS_ING = ["burning", "rocking", "boxing", "bouncing"]
VERBS_ED = ["karate chopped", "levitated", "backflipped", "sprinted"]
NOUNS = ["spaceship", "leopard", "bobcat", "garden gnome"]
ADVERBS = ["angrily", "elegantly", "cheerfully", "mysteriously"]
ADJECTIVES = ["confused", "amazed", "hopeful", "befuddled"]

desired_verb1 = VERBS_ING.sample
desired_verb2 = VERBS_ING.sample
desired_verb3 = VERBS_ED.sample
desired_verb4 = VERBS_ED.sample

desired_noun1 = NOUNS.sample

desired_adverb1 = ADVERBS.sample
desired_adverb2 = ADVERBS.sample

desired_adj1 = ADJECTIVES.sample

story.gsub!("x1", desired_verb1)
story.gsub!("x2", desired_noun1)
story.gsub!("x3", desired_adverb1)
story.gsub!("x4", desired_verb2)
story.gsub!("x5", desired_adverb2)
story.gsub!("x6", desired_verb3)
story.gsub!("x7", desired_verb4)
story.gsub!("x8", desired_adj1)

puts story
