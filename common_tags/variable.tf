variable "application" {
    type = string
	description	= "Provide application name"
    
}
variable "name" {
    type = string
	description	= "Provide resource name"
    
}

variable "enviroment" {
    type = string
	description	= "Provide environment (DEV/TEST/PRD)"
}

variable "support" {
    type = string
	description	= "email ID of the user who can support on it"


}

variable "creater" {
    type = string
	description	= "Provide name of source or who is created the resource"
}

variable "additional_tags"{
	type = map(string)
	default = null
	description = "If user wants to add any other additional tags to resource"
}

variable "project" {
	type = string
	default = null
	description = "Project name for you are creating the resources"
}
