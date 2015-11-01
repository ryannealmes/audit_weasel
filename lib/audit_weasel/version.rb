# Gem follows symantic versioning
# http://guides.rubygems.org/patterns/#semantic-versioning
module AuditWeasel
  MAJOR = 0
  MINOR = 0
  TINY  = 1
  PRE   = nil

  VERSION = [MAJOR, MINOR, TINY, PRE].compact.join('.')
end
