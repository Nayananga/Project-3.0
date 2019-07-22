bot_template = 'BOT : {0}'
user_template = 'USER : '

#funtion to respond to user message
def respond(message):
	if message in responses:
		bot_message = responses[message]
	else:
		bot_message = responses['default']
	return bot_message

#funtion to send message to Bot 
def send_message(message):
	#print(user_template.format(message))
	response = respond(message)
	print(bot_template.format(response))


questions  = [
		'How good was the outside environment of the restaurant?\n1. Very Pleasant\n2. Pleasant\n3. Moderate\n4. Bad\n5. Worse',
		'How good was the ambiant of the restaurant?\n1. Very Neat & Pleasant\n2. Neat & Pleasant\n3. Moderate\n4. Bad\n5. Worse',
		'What is your comment on the food?\n1. Very Tasty\n2. Tasty\n3. Fair enough\n4. Bad\n5. Horrible',
		'Are they storing the prepared foods in a Hygiene Container?\n1. Yes\n2. No',
		'Are they providing clean water to drink, is it paid or free?\n1. Yes and its free\n2. Yes but paid\n3. No, it is not clean enough',
		'Is there adequate amount of waste bins with litters\n1. Yes\n2. Yes, but can have more\n3. No',
		'Are they preparing and serving food with clean utensils,equipments?\n1. Yes\n2. Moderate\n3. No'
]

responses = {
	'Hi' : 'Hey there, pleasure to talk with you!!!\n Shall we begin?',
	'Yes': questions[0], 
	'default' : 'default message'	
}

def main():
	send_message(raw_input('Say Hi!: '))
	send_message(raw_input(user_template))

main()
