#Function that takes a list of strings an prints them, one per line, in a rectangular frame
require '../modules/mmg'

a = %w[ Presenting vodafone Operations PLC As displayed by its greatest and most fabulous administrator Michael McGearty ]
Printinbox.printout(a, Printinbox.stringsize(a))
