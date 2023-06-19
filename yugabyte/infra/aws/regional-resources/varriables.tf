variable "prefix" {
  type = string
  description = "Prefix for all resources"
  default = "yb"
}

variable "tags" {
  type = map(string)
  description = "Common tags for all the resources. These will be merge with custom tags added to resources and provvider level tags"
  default = {}
}
