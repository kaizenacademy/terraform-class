output "cluster_id" {
	value = module.eks.cluster_id
}
output "cluster_arn" {
	value = module.eks.cluster_arn
}
output "cluster_version" {
	value = module.eks.cluster_version
}
output "cluster_security_group_id" {
	value = module.eks.cluster_security_group_id
}
output "workers_asg_names" {
	value = module.eks.workers_asg_names
}