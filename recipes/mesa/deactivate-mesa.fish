if [ $XLIB_SKIP_ARGB_VISUALS_BACKUP ];
    set -gx XLIB_SKIP_ARGB_VISUALS $XLIB_SKIP_ARGB_VISUALS_BACKUP
    set -e XLIB_SKIP_ARGB_VISUALS_BACKUP
else
    set -e XLIB_SKIP_ARGB_VISUALS
end
