using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DACS.Migrations
{
    /// <inheritdoc />
    public partial class UpdateModel : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Podcasts_PodcastID",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_Podcasts_Playlists_PlaylistID",
                table: "Podcasts");

            migrationBuilder.DropForeignKey(
                name: "FK_Ratings_Podcasts_PodcastID",
                table: "Ratings");

            migrationBuilder.DropIndex(
                name: "IX_Podcasts_PlaylistID",
                table: "Podcasts");

            migrationBuilder.DropColumn(
                name: "PlaylistID",
                table: "Podcasts");

            migrationBuilder.RenameColumn(
                name: "PodcastID",
                table: "Ratings",
                newName: "EpisodeID");

            migrationBuilder.RenameIndex(
                name: "IX_Ratings_PodcastID",
                table: "Ratings",
                newName: "IX_Ratings_EpisodeID");

            migrationBuilder.RenameColumn(
                name: "Duration",
                table: "Podcasts",
                newName: "EpNum");

            migrationBuilder.RenameColumn(
                name: "PodcastID",
                table: "Comments",
                newName: "EpisodeID");

            migrationBuilder.RenameIndex(
                name: "IX_Comments_PodcastID",
                table: "Comments",
                newName: "IX_Comments_EpisodeID");

            migrationBuilder.AddColumn<string>(
                name: "ImageURL",
                table: "Topics",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "EpImage",
                table: "Episodes",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "PlaylistID",
                table: "Episodes",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AvatarURL",
                table: "Artists",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Episodes_PlaylistID",
                table: "Episodes",
                column: "PlaylistID");

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Episodes_EpisodeID",
                table: "Comments",
                column: "EpisodeID",
                principalTable: "Episodes",
                principalColumn: "EpisodeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Episodes_Playlists_PlaylistID",
                table: "Episodes",
                column: "PlaylistID",
                principalTable: "Playlists",
                principalColumn: "PlaylistID");

            migrationBuilder.AddForeignKey(
                name: "FK_Ratings_Episodes_EpisodeID",
                table: "Ratings",
                column: "EpisodeID",
                principalTable: "Episodes",
                principalColumn: "EpisodeId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Episodes_EpisodeID",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_Episodes_Playlists_PlaylistID",
                table: "Episodes");

            migrationBuilder.DropForeignKey(
                name: "FK_Ratings_Episodes_EpisodeID",
                table: "Ratings");

            migrationBuilder.DropIndex(
                name: "IX_Episodes_PlaylistID",
                table: "Episodes");

            migrationBuilder.DropColumn(
                name: "ImageURL",
                table: "Topics");

            migrationBuilder.DropColumn(
                name: "EpImage",
                table: "Episodes");

            migrationBuilder.DropColumn(
                name: "PlaylistID",
                table: "Episodes");

            migrationBuilder.DropColumn(
                name: "AvatarURL",
                table: "Artists");

            migrationBuilder.RenameColumn(
                name: "EpisodeID",
                table: "Ratings",
                newName: "PodcastID");

            migrationBuilder.RenameIndex(
                name: "IX_Ratings_EpisodeID",
                table: "Ratings",
                newName: "IX_Ratings_PodcastID");

            migrationBuilder.RenameColumn(
                name: "EpNum",
                table: "Podcasts",
                newName: "Duration");

            migrationBuilder.RenameColumn(
                name: "EpisodeID",
                table: "Comments",
                newName: "PodcastID");

            migrationBuilder.RenameIndex(
                name: "IX_Comments_EpisodeID",
                table: "Comments",
                newName: "IX_Comments_PodcastID");

            migrationBuilder.AddColumn<int>(
                name: "PlaylistID",
                table: "Podcasts",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Podcasts_PlaylistID",
                table: "Podcasts",
                column: "PlaylistID");

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Podcasts_PodcastID",
                table: "Comments",
                column: "PodcastID",
                principalTable: "Podcasts",
                principalColumn: "PodcastID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Podcasts_Playlists_PlaylistID",
                table: "Podcasts",
                column: "PlaylistID",
                principalTable: "Playlists",
                principalColumn: "PlaylistID");

            migrationBuilder.AddForeignKey(
                name: "FK_Ratings_Podcasts_PodcastID",
                table: "Ratings",
                column: "PodcastID",
                principalTable: "Podcasts",
                principalColumn: "PodcastID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
