require 'shrine'
require 'shrine/storage/file_system'

#require "shrine/storage/tus"

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger

Shrine.storages = {
    # cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    # store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
    cache: Shrine::Storage::FileSystem.new(Rails.root.join("public"), prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new(Rails.root.join("public"), prefix: "uploads/store")
    #tus:   Shrine::Storage::Tus.new,
}

Shrine.plugin :activerecord
#Shrine.plugin :cached_attachment_data
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type