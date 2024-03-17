resource "github_repository" "test-repo" {
  name        = var.repo_name
  description = "Readme file for ${var.repo_name} repo"
  visibility  = "public"
  has_issues  = true
  has_downloads = true
  is_template = true

}

resource "null_resource" "create_files" {
  triggers = {
    github_repository_id = github_repository.test-repo.id
  }

  provisioner "local-exec" {
    command = <<-EOT
      git clone https://github.com/${var.github_organization}/${var.repo_name}.git
      cd ${var.repo_name}
      echo "# ${var.repo_name}" >> README.md
      mkdir -p .github/workflows
      touch .gitignore
      git add .
      git commit -m "Initialize repository with files"
      git push
    EOT
  }
}