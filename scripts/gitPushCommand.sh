function gitpusha()
{
    git add .;
    git commit -m "Update $(date "+%m/%d/%Y")";
    git push;
}
