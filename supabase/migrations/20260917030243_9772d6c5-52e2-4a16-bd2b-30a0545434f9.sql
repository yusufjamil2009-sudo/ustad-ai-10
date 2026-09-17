-- 1) Gallery: remove auth.uid()-based policies that can never match this app's guest identity model.
DROP POLICY IF EXISTS gallery_images_owner_select ON public.gallery_images;
DROP POLICY IF EXISTS gallery_images_owner_insert ON public.gallery_images;
DROP POLICY IF EXISTS gallery_images_owner_delete ON public.gallery_images;
DROP POLICY IF EXISTS gallery_shares_owner_select ON public.gallery_shares;
DROP POLICY IF EXISTS gallery_shares_owner_insert ON public.gallery_shares;
DROP POLICY IF EXISTS gallery_shares_owner_delete ON public.gallery_shares;
DROP POLICY IF EXISTS gallery_share_items_owner_read ON public.gallery_share_items;
DROP POLICY IF EXISTS gallery_share_items_owner_write ON public.gallery_share_items;
DROP POLICY IF EXISTS gallery_share_items_owner_delete ON public.gallery_share_items;

ALTER TABLE public.gallery_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.gallery_shares ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.gallery_share_items ENABLE ROW LEVEL SECURITY;

REVOKE ALL ON public.gallery_images FROM anon, authenticated;
REVOKE ALL ON public.gallery_shares FROM anon, authenticated;
REVOKE ALL ON public.gallery_share_items FROM anon, authenticated;

GRANT ALL ON public.gallery_images TO service_role;
GRANT ALL ON public.gallery_shares TO service_role;
GRANT ALL ON public.gallery_share_items TO service_role;

-- 2) SECURITY DEFINER functions: only trusted server code may execute them.
REVOKE ALL ON FUNCTION public.ustad_coin_apply(text, text, text, bigint, text, text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_shop_buy(text, text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_ticket_grant(text, integer) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_ticket_consume(text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_create_guest_account(text, text, text, text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_issue_fresh_session(text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_refresh_session(text, uuid) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.ustad_revoke_session(uuid, text) FROM PUBLIC, anon, authenticated;

GRANT EXECUTE ON FUNCTION public.ustad_coin_apply(text, text, text, bigint, text, text) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_shop_buy(text, text) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_ticket_grant(text, integer) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_ticket_consume(text) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_create_guest_account(text, text, text, text) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_issue_fresh_session(text) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_refresh_session(text, uuid) TO service_role;
GRANT EXECUTE ON FUNCTION public.ustad_revoke_session(uuid, text) TO service_role;