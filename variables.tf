variable "token" {
  type    = string
  default = "ghp-XXX" #github PAT  
}

variable "repo_name" {
  description = "The name of the GitHub repository to create"
  type        = string
  default     = "default-repo-name"
}

variable "github_organization" {
  description = "The name of the GitHub org"
  type        = string
  default     = "keertisy"
}