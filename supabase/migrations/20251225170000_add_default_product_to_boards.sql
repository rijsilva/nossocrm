-- Add default product per board (optional)
-- This enables "produto padrão" configuration for a pipeline.

ALTER TABLE public.boards
ADD COLUMN IF NOT EXISTS default_product_id UUID REFERENCES public.products(id);

-- Optional index for faster joins/filters (cheap)
CREATE INDEX IF NOT EXISTS boards_default_product_id_idx
ON public.boards(default_product_id);

