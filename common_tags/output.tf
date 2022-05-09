output "commontags" {
    value = merge({
        Name = var.name
        project = var.project
        Enviroment = var.enviroment
        Application = var.application
        Support = var.support
        Creater  =var.creater

    },
	var.additional_tags,
	)

}
